using FragrantWorld.Pages;
using System.Configuration;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace FragrantWorld
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Frame CurrentFrame { get; set; }

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            CurrentFrame = new Frame();
            CurrentFrame.Navigate(new ShopPage());
        }
    }

}
