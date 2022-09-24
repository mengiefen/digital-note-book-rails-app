class NoteLinksController < ApplicationController
  def create
    source = Note.find(params[:source_id])
    target = Note.find(params[:target_id])

    # swap source and target if source is newer than target
    if source != target
      source.notes << target
      target.notes << source
    end

    @notes = [source, target]
  end
end
