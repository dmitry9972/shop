

def deco_func(base_func):
  def wrapper(arg1):
  	argd =' decorated '+ arg1 + ' decorated '
  	base_func(argd)
  return wrapper

@deco_func
def basic_func(arg):
  print(arg)


basic_func('1HAHAHA!')
