## food
Feed me a bunch of food items in STDIN, and I'll return caloric information via the fatsecret API.

## Usage
1. Register for a key at http://platform.fatsecret.com/api/
2. Rename config.toml.sample to config.toml and set your keys
3. Use it:

```shell
$ bundle install
$ ruby food.rb < today.txt
```
