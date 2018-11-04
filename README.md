# Anjos do Bem


## Iniciar Tarefas em Background
No Terminal, digitar:
```
# Desenvolvimento
CheckFacebookNotificationsJob.perform_later

bundle exec rake jobs:work 
```

CTRL + C para para o delayed_job