class ContactsController < ApplicationController

  def show
    @contact = Contact.find_by({"id" => params["id"]})
    @company = Company.find_by({"id" => @contact["company_id"]})
    # render contacts/show view with details about Contact
  end

  def new
    # render contacts/new view with new Contact form
  end

  def create
    # start with a new Contact
    @contact = Contact.new

    # assign user-entered form data to Contact's columns
    @contact["first_name"] = params["first_name"]
    @contact["last_name"] = params["last_name"]
    @contact["email"] = params["email"]
    @contact["phone_number"] = params["phone_number"]

    # assign relationship between Contact and Company
    @contact["company_id"] = params["company_id"]

    # save Contact row
    @contact.save

    # redirect user
    redirect_to "/companies/#{@contact["company_id"]}"
  end
  
end
