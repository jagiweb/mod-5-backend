class ContactsController < ApplicationController
    
    def post_contacts
        contact = Contact.create(contact_params)
        render json: {contact: contact}
    end

    def all_contacts
        contacts = Contact.all
        contacts = contacts.map {|contact| {name: contact.name, email: contact.email, description: contact.description, id: contact.id}}
        render json:{ contacts: contacts}
    end

    def show
        contact = Contact.find_by(id: params[:id])
        if news 
            render json: {contact: contact}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def destroy
        contact = Contact.find_by(id: params[:id])

        if contact
            contact.destroy
            render json: {message: "Success"}
        else
            render json: {message: "NOT WORKING"}
        end
    end

    private

    def contact_params
        params.permit(:name, :description, :email)
    end
end
