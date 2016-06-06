namespace :clear_expired_envelopes do
  desc "delete expired envelopes from the database"
  task clear_envelopes: :environment do
    @envelopes = Envelope.all
    @envelopes.each do |envelope|
      if  envelope.expiration < DateTime.now
        envelope.delete
      end
    end
  end
end
