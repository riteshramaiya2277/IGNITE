using System;
using System.Security.Cryptography;

namespace IGNITE.AuthOnboarding
{
    internal static class AuthSecurity
    {
        private const int Iterations = 100000;
        private const int SaltSize = 16;
        private const int HashSize = 32;

        internal static byte[] CreateSalt()
        {
            byte[] salt = new byte[SaltSize];
            using (var generator = RandomNumberGenerator.Create())
            {
                generator.GetBytes(salt);
            }

            return salt;
        }

        internal static byte[] HashPassword(string password, byte[] salt)
        {
            using (var deriveBytes = new Rfc2898DeriveBytes(password, salt, Iterations))
            {
                return deriveBytes.GetBytes(HashSize);
            }
        }

        internal static bool VerifyPassword(string password, byte[] salt, byte[] expectedHash)
        {
            byte[] actualHash = HashPassword(password, salt);
            if (actualHash.Length != expectedHash.Length)
            {
                return false;
            }

            int difference = 0;
            for (int index = 0; index < actualHash.Length; index++)
            {
                difference |= actualHash[index] ^ expectedHash[index];
            }

            return difference == 0;
        }
    }
}