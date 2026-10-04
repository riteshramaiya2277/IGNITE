using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IGNITE
{
    /// <summary>
    /// Helper class for database operations to reduce code duplication
    /// </summary>
    public static class DatabaseHelper
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["IGNITEConnection"].ConnectionString;

        /// <summary>
        /// Executes a SQL query and returns a DataTable
        /// </summary>
        public static DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        return table;
                    }
                }
            }
        }

        /// <summary>
        /// Executes a stored procedure and returns a DataTable
        /// </summary>
        public static DataTable ExecuteStoredProcedure(string procedureName, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        return table;
                    }
                }
            }
        }

        /// <summary>
        /// Executes a SQL query and returns a single value
        /// </summary>
        public static object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    return command.ExecuteScalar();
                }
            }
        }

        /// <summary>
        /// Executes a stored procedure and returns a single value
        /// </summary>
        public static object ExecuteScalarStoredProcedure(string procedureName, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    return command.ExecuteScalar();
                }
            }
        }

        /// <summary>
        /// Executes a non-query SQL command (INSERT, UPDATE, DELETE)
        /// </summary>
        public static int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    return command.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Executes a non-query stored procedure
        /// </summary>
        public static int ExecuteNonQueryStoredProcedure(string procedureName, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    return command.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Safely gets an integer value from a DataRow, handling DBNull
        /// </summary>
        public static int GetInt(DataRow row, string columnName, int defaultValue = 0)
        {
            if (row[columnName] != DBNull.Value)
            {
                return Convert.ToInt32(row[columnName]);
            }
            return defaultValue;
        }

        /// <summary>
        /// Safely gets a string value from a DataRow, handling DBNull
        /// </summary>
        public static string GetString(DataRow row, string columnName, string defaultValue = "")
        {
            if (row[columnName] != DBNull.Value)
            {
                return row[columnName].ToString();
            }
            return defaultValue;
        }

        /// <summary>
        /// Safely gets a DateTime value from a DataRow, handling DBNull
        /// </summary>
        public static DateTime GetDateTime(DataRow row, string columnName, DateTime? defaultValue = null)
        {
            if (row[columnName] != DBNull.Value)
            {
                return Convert.ToDateTime(row[columnName]);
            }
            return defaultValue ?? DateTime.Now;
        }

        /// <summary>
        /// Safely gets a boolean value from a DataRow, handling DBNull
        /// </summary>
        public static bool GetBool(DataRow row, string columnName, bool defaultValue = false)
        {
            if (row[columnName] != DBNull.Value)
            {
                return Convert.ToBoolean(row[columnName]);
            }
            return defaultValue;
        }

        /// <summary>
        /// Safely gets a decimal value from a DataRow, handling DBNull
        /// </summary>
        public static decimal GetDecimal(DataRow row, string columnName, decimal defaultValue = 0)
        {
            if (row[columnName] != DBNull.Value)
            {
                return Convert.ToDecimal(row[columnName]);
            }
            return defaultValue;
        }

        /// <summary>
        /// Creates a SqlParameter for string values
        /// </summary>
        public static SqlParameter CreateParam(string name, string value)
        {
            return new SqlParameter(name, value ?? (object)DBNull.Value);
        }

        /// <summary>
        /// Creates a SqlParameter for integer values
        /// </summary>
        public static SqlParameter CreateParam(string name, int value)
        {
            return new SqlParameter(name, value);
        }

        /// <summary>
        /// Creates a SqlParameter for DateTime values
        /// </summary>
        public static SqlParameter CreateParam(string name, DateTime? value)
        {
            return new SqlParameter(name, value ?? (object)DBNull.Value);
        }

        /// <summary>
        /// Creates a SqlParameter for boolean values
        /// </summary>
        public static SqlParameter CreateParam(string name, bool value)
        {
            return new SqlParameter(name, value);
        }
    }
}
