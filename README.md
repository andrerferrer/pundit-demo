## Setup

### Install the gem

```ruby
# Gemfile
gem 'pundit' # <- add it
```

### Add it to you Application Controller

```ruby
  include Pundit

  # Pundit: using the white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Rescue from pundit error -> add this when pushing to production
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
```

## Set it up for each controller and each action

### 1. Generate the policy

```ruby
rails g pundit:policy article
```
### 2. Authorize in the policy
```ruby
# ArticlePolicy
def show?
  # anyone can show
  true
end
```

* If you see a `Pundit::NotAuthorizedError` the above is what you need to do.

### 3. Authorize in the controller
```ruby
# In the ArticlesController
def show
  authorize @article
end
```

* If you see a `Pundit::AuthorizationNotPerformedError` the above is what you need to do.
