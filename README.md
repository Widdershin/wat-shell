# wat-shell
Replace Bash with Ruby, because why not?

`wat` is a shell built on top of Ruby. It provides easy access to bash commands like `cat`, `git` and `wget`. The output is returned as an array of lines, so you can intermix ruby and a limited form of bash.

Installation
---

```bash
$ gem install wat-shell
```

Interactive wat shell
---

To start the `wat` repl, simply run `wat`.

```bash
$ wat
wat(main):001:0>
```

This is a version of `irb` with `wat-shell` included.

```ruby
wat(main):001:0> cat(LICENSE).sample
=> "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,"
wat(main):002:0> puts git log --oneline
47ffa5a Rename wat.rb executable to wat
90acaa2 Support "cat LICENSE" by implementing const_missing
4f2701c Execute wat-shell scripts with exe/wat script.rb
a7369e9 Set up wat with interpreter
a7a2f80 Initial commit
=> nil
wat(main):003:0>
```

Scripting with wat
---

And of course, what shell wouldn't be complete without the ability to execute files?

If we create a file, `test.rb`, with this content:
```ruby
puts du('-sh .').first
```

We can run it like so:

```bash
$ wat test.rb
344K    .
```

You can't be serious?
---

I'm not. This is a joke! Please don't use it for anything serious.


How on earth?
---
I overload `method_missing` to shell out if a command exists, or to return a string otherwise.

Check out the code. It's short and nasty.
