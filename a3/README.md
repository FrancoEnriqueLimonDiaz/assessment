# Part II

This is the Rails starter code for take-home assessment.

## Take-home assessment: Invoices management

### * Project setup
- Ruby version: 3.1.0
- PostgreSQL (at least version 9.3 installed)
- Configuration: You can use any container manager such as Docker, or setup directly in your local.

### * User stories
- As an authenticated User, I want to create invoices so that I can add custom invoices.

- As an authenticated User, I want to edit invoices so that I can correct any invoice data.

- As an authenticated User, I want to remove invoices so that I can discard unnecessary invoices.

- As an authenticated User, I want to see the list of all the created/uploaded invoices so that I can found invoices easily.
  + Acceptance criteria:
    - The user should be able to filter invoices by status, emitter, receiver and amount range

- As an authenticated User, I want to see a list of all the invoices I have received from a provider(emitter)
  + Acceptance criteria:
    - The user should be able to filter invoices by issue date (emitted_at)
    - The user should be able to see the total amount of the filtered list

- As an authenticated User, I want to import a set of XML that contain invoices so that I can see the invoice data in the database.
  + Acceptance criteria:
    - The user should be able to upload hundreds of files at a time (extract the ZIP file `public/20220811012132-invoices.zip` to see the XML format and test with that batch of XML files. Feel free to update the XML data)
    - If you need to create more XML files, after extracting the zip run this task `rake xml:generate_invoice` to generate more XML files within that same extracted directory `public/20220811012132-invoices/`
    - Hint: take a look at active_support’s `Hash.from_xml`

- As an authenticated User, I want to have an endpoint that renderizes the image of invoice `cfdi_digital_stamp` as QR so that I can read it faster

### * Observations
- A user is a invoice receiver and is able to upload invoices
- This Rails app was created for only API.

### * Objectives
- A reasonable architecture. No need to tune performance, but use best practices of...
  - software design: design principles (SOLID) and design patterns
  - performance: like paging, avoiding n+1 queries, background processing, etc. where you think it makes sense.
- Testing, it is very important for us to see that you understand how to test Ruby on Rails code.
- Well-organized code and following conventions (`rubocop`)
- The code doesn't need to be perfect, but aim for good readability.

### * Delivery instructions
- Let us know when you have started. Publish your code on `Github` and share it with the initial commit
- Write us any question, or doubt by e-mail message.
- Delivery:
  - If you implemented API only, use Postman, or any other similar
  - Optional: use a client app or use Rails to render server/client side
  - Bonus: put it online. You can use Heroku, or any other similar
- When you have completed, let us know by e-mail.

# Create User
sign up
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "francoenrique@live.com", "password": "123456" } }' http://localhost:3000/users
Sign in
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "francoenrique@live.com", "password": "123456" } }' http://localhost:3000/users/sign_in
{
    "user": {
        "email": "francoenrique@live.com",
        "password": "123456"
    }
}
# Create Inovice
create inovice
curl -XPOST -H "Authorization: Bearer be0f5fc807f794ba168710e8c971c30805f99a73bd8f93603a8a70a182bc7cbcd061401b1c6481b19ea802878892ebfc6755975bd59e9139a91014db04630f60" -H "Content-Type: application/json" -d '{ "api_v1_invoice": { "status": "Active", "emitter": "User_id","receiver": "User_id", "amount": "123456"} }' http://localhost:3000/api/v1/invoices
{
    "api_v1_invoices": {
        "status": "Inactive",
        "emitter": "francoenrique@live.com",
        "receiver": "User_id",
        "amount": "59803",
        "emitted_at": ""
    }
}

# Create login
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjYyODM4NDQ5LCJleHAiOjE2NjQxMzQ0NDksImp0aSI6ImRlNzdhNmVmLTY2ZWQtNDYxZi04ZjIxLWUyZTUzMDZiNjc4ZSJ9._UEs9RRlgBGpzlhaAvfgyKwaI11Pa3B4O2iTE26nSpg 
