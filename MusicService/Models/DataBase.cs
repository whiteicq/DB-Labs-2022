using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace MusicService.Models
{
    class DataBase
    {
        private SqlConnection sqlConnection;
        public static DataBase Instance;
        private DataBase()
        {
            sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MusicService"].ConnectionString);
            sqlConnection.Open();
        }
        public static DataBase CreateDataBase()
        {
            if (Instance is null)
            {
                Instance = new DataBase();
            }
            return Instance;
        }

        private bool IsCorrectUser(string name, string alias, string dateOfBirth, string roleTitle)
        {
            if(name is not null && alias is not null && dateOfBirth is not null && roleTitle is not null)
            {
                return true;
            }
            return false;
        }

        private bool IsCorrectAccount(string email, string password)
        {
            if (email is not null && password is not null)
            { return true; }
            return false;
        }

        private bool IsCorrectUser(string title, string foundingDate, int numberArtists, string roleTitle)
        {
            if (title is not null && foundingDate is not null && numberArtists >= 0 && roleTitle is not null)
            {
                return true;
            }
            return false;
        }

        public void CreateVisitor(string email, string password, string name, string alias, string dateOfBirth, string roleTitle)
        {
            if (IsCorrectAccount(email, password) && IsCorrectUser(name, alias, dateOfBirth, roleTitle))
            {
                SqlCommand sqlCommand = new SqlCommand($"EXEC AddVisitor @{email} @{password} @{roleTitle} @{name} @{alias} @{dateOfBirth}");
            }
        }

        public void CreateArtist(string email, string password, string name, string alias, string dateOfBirth, string roleTitle)
        {
            if (IsCorrectAccount(email, password) && IsCorrectUser(name, alias, dateOfBirth, roleTitle))
            {
                SqlCommand sqlCommand = new SqlCommand($"EXEC AddArtist @{email} @{password} @{roleTitle} @{name} @{alias} @{dateOfBirth}");
            }
        }

        public void CreateGroup(string email, string password, string title, string foundingDate, int numberOfArtist, string roleTitle)
        {
            if(IsCorrectAccount(email, password) && IsCorrectUser(title, foundingDate, numberOfArtist, roleTitle))
            {
                SqlCommand sqlCommand = new SqlCommand($"EXEC AddGroup @{email} @{password} @{roleTitle} @{title} @{foundingDate} @{numberOfArtist} ");
            }
        }
    }
}
