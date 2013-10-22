## food
Feed me a bunch of food items and I'll return caloric information for them (currently through FatSecret API).

## Usage
1. Register for a key at http://platform.fatsecret.com/api/
2. Add the consumer key (login) and shared secret (shared secret) to your ~/.netrc:

```shell
machine fatsecret.com
  login c11f0d36coffee7968faa0920deadbeef
  password 9729004a43110a28905fff8008135
```

3. Use it:

```shell
$ food lookup "peanut butter" jelly thyme
 Peanut Butter: 1 tbsp 94 cal 3.13 crb 8.06 fat 1.0 fib 4.01 pro
 Jelly (All Flavors): 1 cup 798 cal 209.85 crb 0.06 fat 3.0 fib 0.45 pro
 Thyme: 1 tsp 1 cal 0.20 crb 0.01 fat 0.1 fib 0.04 pro
```
