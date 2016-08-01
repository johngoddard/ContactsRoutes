class ContactsController < ApplicationController

  def index
    contact = User.find_by(id: params[:user_id]).contacts
    shared_contacts = User.find_by(id: params[:user_id]).shared_contacts
    render json: [contact, shared_contacts]
    # render json: Contact.all
  end

  def show
    contacts = Contact.find_by(id: params[:id])
    render json: contacts
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render( json: contact.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact.destroy
      render json: contact
    else
      render(json:  contact.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(json:  contact.errors.full_messages, status: :unprocessable_entity )
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
