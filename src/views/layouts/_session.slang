- if (current_user = context.current_user)
  li.nav-item
    a.nav-link href="/profile"
      current_user.email
  li.nav-item
    a.nav-link href="/signout"
      | Sign Out
- else
  - active = context.request.path == "/signin" ? "active" : ""
  li.nav-item
    a.nav-link href="/signin"
      | Sign In
  - active = context.request.path == "/signup" ? "active" : ""
  li.nav-item
    a.nav-link href="/signup"
      | Sign Up

