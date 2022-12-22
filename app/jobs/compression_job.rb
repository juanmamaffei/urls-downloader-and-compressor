class CompressionJob < ApplicationJob
  def perform(petition_id)
    petition = petition(petition_id)
    OrchestrateCompression.new(petition).run
  end

  private

  def petition(petition_id)
    Petition.includes(:subfiles).find(petition)
  end
end
