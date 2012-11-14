import os
import sys

dotfiles_path = os.path.realpath( os.path.dirname(__file__) )
homedir = os.path.expanduser('~')

# exchange information with user
answer = None
for filename in os.listdir(dotfiles_path):
  if filename in  (__file__, '.gitmodules', '.git'):
    continue
  else:
    pass
  source = os.path.join(dotfiles_path, filename)
  target = os.path.join(homedir,filename)
  try:
    os.symlink(source, target)
    print 'I am creating a symlink from', source, 'to', target
  except IOError as exc:
    pass
  except OSError as exc:
    code, message = exc.args
    if code == 17:
      while answer is None:
        if answer is not None:
          print "The answer is: ", answer
        if answer is not None and answer not in ['allyes', 'allno', 'yes', 'no']:
          print "Sorry, I did not get that, would you come again, please?"
        if answer is None or answer not in ['allyes', 'allno']:
          answer = raw_input("Target file %s exists. Would you like to override it? [all]yes / [all]no " % target)
          if answer in ['allyes', 'allno', 'yes','no']:
            break 
      if answer in ['allyes', 'yes']:
        print "I'm gladly obey, my master"
        print "I'm unlinking", target
        os.unlink(target)
        print "I'm creating new link to ", target, 'from', source
        os.symlink(source, target)
        if answer == 'yes':
          answer = None
      elif answer in ['allno', 'no']:
        print "Ok, I will not do it"
        if answer == 'no':
          answer = None
  finally:
    pass
