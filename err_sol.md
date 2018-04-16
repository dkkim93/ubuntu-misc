### apt_pkg
#### Problem
Problem of importing `apt_pkg` inside python3.6:
```
Original exception was:
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3/dist-packages/apt/__init__.py", line 23, in <module>
    import apt_pkg
ModuleNotFoundError: No module named 'apt_pkg'
```

#### Solution
`/usr/lib/python3/dist-packages# cp apt_pkg.cpython-34m-i386-linux-gnu.so apt_pkg.so`
