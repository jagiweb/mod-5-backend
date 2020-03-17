class ContactsController < ApplicationController
    
    def post_contacts
        contact = Contact.create(contact_params)
        render json: {image_url: url_for(contact.news_image), contact: contact}
    end

    def all_contacts
        contacts = Contact.all
        contacts = contacts.map {|contact| {image_url: url_for(contact.contact_image), title: contact.title, description: contact.description, id: contact.id}}
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
        params.permit(:title, :contact_image, :description, :user_id)
    end
end
