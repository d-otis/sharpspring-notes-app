# NotesApp

Live Deployment on Heroku @ https://floating-inlet-10981.herokuapp.com/

## Table of Contents
- [NotesApp](#notesapp)
  - [Table of Contents](#table-of-contents)
  - [Features/Acceptance Criteria](#featuresacceptance-criteria)
  - [Non-functional Requirements](#non-functional-requirements)
  - [Process](#process)
  - [Challenges](#challenges)
  - [Stretch Goals](#stretch-goals)

## Features/Acceptance Criteria

* `/login` page with `email` and `password` fields
* warning message is displayed upon authentication failure (I chose to keep this vague for security reasons even though I had access to the errors in the `@user.errors` hash)
* session established upon successful login && user routed to `/dashboard`
* `/dashboard` page serves as `user#show` and `notes#index`
* `User` can `CRUD` only notes that they own
* `Note` `title` cannot be longer than 30 characters
* `Note` `body` cannot be longer than 1000 characters
* If `Note` lacks `title`, one is generated from `body`, but note cannot be created with blank fields for both `title` and `body`
* RSpecs for models and their validations as well as starting points for the continuation of spec development with controllers and features.
* Action Mailer sends email to `User` upon `Note` creation

## Non-functional Requirements

* Interface was skinned with some basic responsive [Bootstrap](https://getbootstrap.com) CSS/JS styling and UI functionality
* App was written in [Ruby on Rails](https://rubyonrails.org)
* App has been deployed to Heroku and can be found here: [https://floating-inlet-10981.herokuapp.com/](https://floating-inlet-10981.herokuapp.com/)

## Process

1. I started off, as always, with pen and paper sketching out the models, their validations, and relationships/associations. From there I listed out features both MVP, feature stretch goals, controller details, view sketches, and finally a gameplan regarding development steps.
2. Once the above was sketched out I made migrations and wrote specs for `Note` and `User` models' validations while developing said models.
3. Afterward, I continued to employ TDD to work out the control flow with controllers for `User` and `Note` as well as certain elements of their views.
4. From here I began working on the `SessionsController` and working out authentication and authorization strategies.

## Challenges

1. I did spend a fair amount of time in the beginning meticulously following TDD practices, but after a while, it was clear that I needed to shift gears and work a bit faster with the given timeline and certain goals I wanted to reach in addition to the prompted acceptance criteria.
2. I got into the weeds a bit writing tests for user features once I layered sessions into the project--so that is an area that I'd like to explore as I wasn't able to flesh out that test coverage as much as I would have liked.
3. This was the first time I'd worked with Action Mailer and was very pleased with the DX. My only headaches came from properly configuring and authorizing the use of a burner Gmail account from which to send emails. Google understandably creates a lot of friction if you're trying to automate their email services.
4. I butted heads with `flash` messages a bit. I've found varying results with using `render` vs `redirect_to` in controller actions in conjunction with successful sending and display of `flash` messages to views. At the end of the day I'd like them to be `render` calls so that a user's work wouldn't be lost on validation failure which happens with using `redirect_to`. I've had success using `render` in previous projects and was even comparing these code bases. Ultimately I felt after a certain point my time was better spent elsewhere, but I would like to nail that given more time.

## Stretch Goals

1. JavaScript-based live character count for note textarea field and title fields.
2. A `Category` model with association to `Note`: either a `has_one` `Category` or `belongs_to` `Category`/ies
3. I experimented a bit with using Rails' ajax features to update the `pinned` boolean status of Notes on the `/dashboard` notes list--I'd definitely be interested in getting this working to avoid redirects/refreshes.
4. Validation logic that doesn't require a user to set a new password if they're updating name or email address.
5. Fix the buggy pin feature that doesn't always stick pinned notes to the top of the list.
