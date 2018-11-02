# Anjos do Bem


## Iniciar Tarefas em Background
No Terminal, digitar:
```
# Desenvolvimento
CheckFacebookNotificationsJob.perform_later

bundle exec sidekiq --environment development -C config/sidekiq.yml 
```

CTRL + C para para o sidekiq