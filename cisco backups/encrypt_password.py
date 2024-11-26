from cryptography.fernet import Fernet

key = Fernet.generate_key()
cipher_suite = Fernet(key)
password = input("Enter the password you would like to encrypt: ")
pass_bin = password.encode()
cipher_text = cipher_suite.encrypt(pass_bin)

print("Encrypted password:", cipher_text)
print("Key:", key)
