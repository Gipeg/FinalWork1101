using DatabaseLibrary.Models;
using DatabaseLibrary.Services;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace FragrantWorld.Pages
{
    /// <summary>
    /// Логика взаимодействия для ShopPage.xaml
    /// </summary>
    public partial class ShopPage : Page
    {
        private readonly ProductService _productService = new();
        private readonly UserService _userService = new();
        private List<Product> _allProducts = new();
        private List<Product> _filteredProducts = new();

        public ShopPage()
        {
            InitializeComponent();
        }

        private async void Page_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadProductsAsync();

            // Заполнение списка производителей
            var manufacturers = _allProducts.Select(p => p.Manufacturer).Distinct().OrderBy(m => m).ToList();
            manufacturers.Insert(0, "Все производители");
            ManufacturerComboBox.ItemsSource = manufacturers;
            ManufacturerComboBox.SelectedIndex = 0;
        }

        private async Task LoadProductsAsync()
        {
            try
            {
                _allProducts = await _productService.GetProductsAsync();
                ApplyFilters();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки продуктов: {ex.Message}");
            }
        }

        private void PopulateManufacturerComboBox()
        {
            var manufacturers = new List<string> { "Все производители" };
            manufacturers.AddRange(_allProducts.Select(p => p.Manufacturer).Distinct().OrderBy(m => m));
            ManufacturerComboBox.ItemsSource = manufacturers;
            ManufacturerComboBox.SelectedIndex = 0;
        }

        private void ApplyFilters()
        {
            var query = _allProducts.AsEnumerable();

            query = FilterByManufacturer(query);
            query = FilterByPrice(query);
            query = FilterBySearch(query);
            query = ApplySorting(query);

            _filteredProducts = query.ToList();

            UpdateProductGrid();
            UpdateProductCount();
        }

        private IEnumerable<Product> FilterByManufacturer(IEnumerable<Product> products)
        {
            return ManufacturerComboBox.SelectedIndex > 0
                ? products.Where(p => p.Manufacturer == ManufacturerComboBox.SelectedItem.ToString())
                : products;
        }

        private IEnumerable<Product> FilterByPrice(IEnumerable<Product> products)
        {
            if (decimal.TryParse(MinPriceBox.Text, out decimal minPrice))
                products = products.Where(p => p.Cost >= minPrice);

            if (decimal.TryParse(MaxPriceBox.Text, out decimal maxPrice))
                products = products.Where(p => p.Cost <= maxPrice);

            return products;
        }

        private IEnumerable<Product> FilterBySearch(IEnumerable<Product> products)
        {
            var searchQuery = SearchTextBox.Text.ToLower();
            return !string.IsNullOrWhiteSpace(searchQuery)
                ? products.Where(p => p.Name.ToLower().Contains(searchQuery))
                : products;
        }

        private IEnumerable<Product> ApplySorting(IEnumerable<Product> products)
        {
            return SortComboBox.SelectedIndex switch
            {
                0 => products.OrderBy(p => p.Cost),
                1 => products.OrderByDescending(p => p.Cost),
                _ => products
            };
        }

        private void UpdateProductGrid()
        {
            ProductItemsControl.ItemsSource = _filteredProducts;
        }

        private void UpdateProductCount()
        {
            ProductCountDisplay.Text = $"{_filteredProducts.Count} из {_allProducts.Count}";
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e) => ApplyFilters();
        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e) => ApplyFilters();
        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e) => ApplyFilters();
        private void MinPriceBox_TextChanged(object sender, TextChangedEventArgs e) => ApplyFilters();
        private void MaxPriceBox_TextChanged(object sender, TextChangedEventArgs e) => ApplyFilters();

        private void CreateProductConteiner(Product productItem)
        {
            try
            {
                var panel = new StackPanel
                {
                    Width = 630,
                    Margin = new Thickness(15),
                    Background = new SolidColorBrush(Color.FromRgb(255, 204, 153))
                };

                var grid = CreateProductGrid(productItem);

                panel.Children.Add(new Border { BorderBrush = Brushes.Black, BorderThickness = new Thickness(1), CornerRadius = new CornerRadius(5) });
                panel.Children.Add(grid);
                panel.Children.Add(new Border { BorderBrush = Brushes.Black, BorderThickness = new Thickness(1), CornerRadius = new CornerRadius(5) });
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка создания контейнера продукта: {ex.Message}");
            }
        }

        private Grid CreateProductGrid(Product productItem)
        {
            var grid = new Grid();
            for (int i = 0; i < 4; i++) grid.RowDefinitions.Add(new RowDefinition());
            grid.ColumnDefinitions.Add(new ColumnDefinition());
            grid.ColumnDefinitions.Add(new ColumnDefinition());

            grid.Children.Add(CreateTextBlock(productItem.Name, FontWeights.Bold, 0, 0));
            grid.Children.Add(CreateTextBlock(productItem.Description, FontWeights.Normal, 1, 0));
            grid.Children.Add(CreateTextBlock($"Производитель: {productItem.Manufacturer}", FontWeights.Normal, 2, 0));
            grid.Children.Add(CreateTextBlock($"Цена: {productItem.Cost}", FontWeights.Normal, 3, 0));

            var orderButton = new Button
            {
                Content = "Заказать",
                HorizontalAlignment = HorizontalAlignment.Right
            };
            Grid.SetRow(orderButton, 3);
            Grid.SetColumn(orderButton, 1);
            grid.Children.Add(orderButton);

            return grid;
        }

        private TextBlock CreateTextBlock(string text, FontWeight fontWeight, int row, int column)
        {
            var textBlock = new TextBlock { Text = text, FontWeight = fontWeight };
            Grid.SetRow(textBlock, row);
            Grid.SetColumn(textBlock, column);
            return textBlock;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (App.CurrentFrame.CanGoBack)
                App.CurrentFrame.GoBack();
        }
    }
}

