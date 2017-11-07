module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_room

    def connect
      self.current_room = find_verified_room
    end

    protected

    def find_verified_room
      if current_room = Room.find_by(id: cookies[:room_id])
        current_room
      else
        reject_unauthorized_connection
      end
    end
  end
end
