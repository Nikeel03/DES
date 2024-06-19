# DES Matlab Lab Implementation
> ## What is DES?
> Cryptography is the science of communication security and is essential to protecting the integrity of sensitive data. DES is the fundamental basic symmetric-key block cipher that has been used for decades. Symmetric cipher refers to the cipher using the same key for encryption and decryption. DES is an old encryption and decryption method that revolutionised cryptography when brought to fruition. At the time, commercial cryptography was not reliable or safe. Thus, a standard was needed. Decades later, DES is still useful in modern cryptography because it provides insights into basic encryption concepts and acts as a standard by which to compare more recent cryptographic algorithms. Matlab is used in this research to investigate DES implementation and experiment attributes of DES, such as the Avalanche effect. Through analysis and the development of a new model, the laboratory aims to shed light on how DES functions. The intention is to explore its advantages and disadvantages as well as its applicability in the context of modern cryptographic standards via testing and validity checks.


## Overview
The Data Encryption Algorithm (DEA) and Data Decryption Algorithm (DDA) were developed using a total of two functions and two .m files, each responsible for the encryption and decryption algorithms, respectively.

## Subkey Generation and Key Scheduling
The initial 64-bit hexadecimal key undergoes conversion into binary and an initial permutation to obtain a 56-bit binary key, satisfying system requirements by removing the 8th bit of every byte (parity bits). Subkey generation involves splitting the 56-bit key into two 28-bit halves. Each half undergoes round-dependent circular shifting operations to produce 16 subkeys. Each 48-bit subkey is used in a different round of encryption. A compression permutation converts the two 28-bit halves into a 48-bit subkey. Key scheduling ensures that each round of encryption uses a unique subkey, enhancing overall security. In the MATLAB function, a cell array holds all 16 subkeys, a design choice explored later.

## Input Plaintext
The input plaintext in the DES algorithm is provided in hexadecimal format, where each character represents a nibble of data. This format offers a compact and readable way to express binary data. Before encryption or decryption, the hexadecimal plaintext is converted into its binary equivalent, ensuring compatibility with the DES algorithm. This conversion decodes each hexadecimal character into its corresponding 4-bit binary representation, resulting in a binary plaintext that can be processed by the DEA.

## Data Encryption Algorithm
This function is the core of the encryption and decryption operations of the DES algorithm. Given a 64-bit input, it is immediately split into left and right 32-bit inputs. The right half undergoes an expansion permutation (E-box) to 48 bits, followed by a bitwise XOR operation with the subkey for that round. The result is processed through substitution tables (S-boxes), which replace eight 6-bit input blocks with 4-bit outputs based on predefined tables. After substitution, a final permutation (P-box) is applied to the resulting 32-bit block. The result is then XORed with the left half of the 64-bit input. This process repeats for each round, except the final round, where the final round's XOR result becomes the left half of the output, and the right half is the previous round’s left input half. Typically, 16 rounds are executed for encryption and decryption.

## Data Decryption Algorithm
The DDA utilizes the established DEA function and subkey generation function. The .m file for decryption differs slightly from the encryption file. While encryption uses a for loop to increment from one to sixteen rounds, decryption involves reversing the subkey generation function's index from 16 to 1. The overall for loop still increments from one to sixteen rounds. Additionally, plaintext variables are renamed to ciphertext variables to distinguish input from output. Hence, the functionality of the algorithms remains virtually identical, except for the round increments.






