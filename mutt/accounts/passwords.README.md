### Setup Instructions

Ensure `gnupg` is installed via homebrew:

```
$ brew install gnupg
```

Generate a USER-ID:

```
$ gpg --gen-key
```

... and make the following selections:

* RSA and RSA (default)
* Key size: 2048
* Key does not expire

... and note the USER-ID output at the end.

Create a plain text password file `mutt/accounts/passwords` with format:

```
user1@email.com: pAzzw0rD1
user2@email.com: pAzzw0rD2
```

... and be sure to escape '$' and '/'.

Encrypt the password file:

```
$ gpg -r "<USER-ID>" -e mutt/accounts/passwords
```

... this will create `mutt/accounts/passwords.gpg`.

During mutt initialization `mutt/accounts/passwords.gpg.tmp` will briefly exist however, these
three files:

* `mutt/accounts/passwords`
* `mutt/accounts/passwords.gpg`
* `mutt/accounts/passwords.gpg.tmp`

... should not be checked into source control (not even the encrypted passwords file since each
machine should have its device specific passwords anyway).

