module GroupsHelper
  def transaction_exists?(t)
    @group.transaction_groups.find_by(transaction_id: t.id)
  end

  def render_controls(event)
    return unless current_user && event.creator.id == current_user.id

    @html_out = ''
    @html_out << "<%= link_to event do %>
          <i class=\"fas fa-link\"></i>
        <% end %>
        <%= link_to edit_event_path(event) do %>
          <i class=\"far fa-edit\"></i>
        <% end %>
        <%= link_to event, method: :delete, data: { confirm: 'Are you sure?' } do %>
          <i class=\"fas fa-trash\"></i>
        <% end %>"
    render inline: @html_out, locals: { event: event }
  end


end
