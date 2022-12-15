using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MusicService.Models;

namespace MusicService.Views
{
    /// <summary>
    /// Логика взаимодействия для RegisterGroupWindow.xaml
    /// </summary>
    public partial class RegisterGroupWindow : Window
    {
        public RegisterGroupWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DataBase.Instance.CreateGroup(EmailTextBox.Text,
                PasswordTextBox.Text,
                TitleTextBox.Text,
                FoundingDateTextBox.Text,
                Convert.ToInt32(NumberOfArtistTextBox.Text),
                roleTitle: "Group");
        }
    }
}
