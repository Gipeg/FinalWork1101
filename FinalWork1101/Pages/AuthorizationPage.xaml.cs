using DatabaseLibrary.Models;
using DatabaseLibrary.Services;
using System.Windows;
using System.Windows.Controls;

namespace FragrantWorld.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        private readonly UserService _userService = new();

        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private async void AuthorizationButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var isCorrectUser = await _userService.IsUserExist(LoginTextBox.Text, PasswordTextBox.Password);
                if (isCorrectUser)
                {
                    var user = await _userService.GetUserByLogin(LoginTextBox.Text);
                    MessageBox.Show($"Добро пожаловать: {user?.Name}", "Успешно");
                    App.CurrentFrame.Navigate(new ShopPage());
                }
                else
                    MessageBox.Show("Неверный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Вы вошли как гость", "Добро пожаловать");
            App.CurrentFrame.Navigate(new ShopPage());
        }
    }
}
