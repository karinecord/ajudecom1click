# Anjos do Bem


## Iniciar Tarefas em Background
No Terminal, digitar:
```
# Desenvolvimento
CheckFacebookNotificationsJob.perform_later

bundle exec rake jobs:work 
```

CTRL + C para para o delayed_job

# Heroku
Na primeira vez, executar o codigo abaixo para adicionar a tarefa de checagem de emails vindo do facebook
```
heroku run rake cron_jobs:set
```

Toda vez que fizer alguma atualiza no codigo, executar:
```
# Roda migracao no banco 
heroku run rake db:migrate

# Reiniciar aplicacao e worker
heroku restart
```

### Logs
```
# Exibe log do worker (responsavel pelas tarefas assincronas)
heroku logs -p worker -t

# Exibe log de tudo
heroku logs --tail
```

Mais info https://devcenter.heroku.com/articles/getting-started-with-rails5