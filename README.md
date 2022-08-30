# LEARN Academy Student Application

The purpose of the LEARN Academy student application is to streamline workflow and facilitate communication between instructors and students.

### ⚡️ Getting Started

- Clone the repository
- Install dependencies by running:
  - `brew install redis`
  - `bundle`
  - `yarn`
  - `rails db:setup`

### 🏁 Start the App

Start the server by running `yarn build`

### 🚗 Testing

Execute the existing testing suite by running `rspec spec`

### 🛁 Linting

This project uses [standard](https://github.com/testdouble/standard) as the project linter.

Execute the linter by running `standardrb`

Fix basic linting mistakes by running `standardrb --fix`

### ✅ Pull Requests

Elements of the commit message:

1. Gitmoji that represents the main objective of the PR

- :lipstick: Adds or fixes UI
- :bulb: Adds or updates code comments
- :wrench: Adds or updates config files
- :memo: Adds or updates documentation
- :heavy_plus_sign: Adds or updates dependencies
- :seedling: Adds or updates seed files or mock data
- :white_check_mark: Adds or updates tests
- :bug: Bug
- :pencil2: Fix typos
- :technologist: Improve developer experience
- :truck: Move or rename files or resources
- :sparkles: New feature
- :recycle: Refactor code
- :mute: Remove console logs
- :iphone: Responsive design
- :construction: Work in progress

2. Ticket ID within brackets: `[2]`
3. Brief description of the content, should be similar to the branch and ticket name

```
📝 [21] updates README
```

Fill out the Pull Request template.

### 📚 Resources and References

Project in managed in Notion. Reach out to a member of the team to gain access.

### Jumpstart Framework

Once a scaffold has been generated for a model, a directory for that model will be generated with views, controllers, and specs. The views have partials (usually starts with an underscore _ ) that are rendered and must be modified to specification.

The controllers need to be modified to handle newly generated columns otherwise turbo_stream will be unable to access those properties.

The specs need to be modified so that forms with changed inputs (such as select) have different assertions.

The general workflow can be broken down into 3 steps.

- The specs

app/spec/models
app/spec/requests
app/spec/views

- The view page

app/views/your_model

- The controller

app/controllers/users/your_model.rb

### 💫 Development Useful Commands

- If you're having issues seeing an updated page

   ```
   $ yarn testbuild:css
   $ yarn testbuild
   ```
   
  However this should be resolved simply by shutting down your server and running `yarn build` again