GitHub Webhook to persist events

![alt text](imgs/add_webhook.png)
 

**How to run**

- `replace GITHUB_WEBHOOK_SECRET in config/boot.rb`
- `rake db:create`
- `rake db:migrate`
- `rails s`

**Tests**

- `bundle exec rspec spec`
