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
    /// Логика взаимодействия для RegisterWindow.xaml
    /// </summary>
    public partial class RegisterWindow : Window
    { 
        public RegisterWindow()
        {   
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DataBase.Instance.CreateVisitor(
                EmailTextBox.Text,
                PasswordTextBox.Text,
                NameTextBox.Text,
                AliasTextBox.Text,
                DateBirthTextBox.Text,
                roleTitle: "Visitor");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            DataBase.Instance.CreateArtist(
                EmailTextBox.Text,
                PasswordTextBox.Text,
                NameTextBox.Text,
                AliasTextBox.Text,
                DateBirthTextBox.Text,
                roleTitle: "Artist");
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            RegisterGroupWindow window = new RegisterGroupWindow();
            window.Show();
        }
    }
}
