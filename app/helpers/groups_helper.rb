module GroupsHelper
  def transaction_exists?(transaction)
    @group.transaction_groups.find_by(transaction_id: transaction.id)
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

  def list_transactions(transaction)
    @html_out = ''
    return unless transaction_exists?(transaction)

    @html_out << "<tr><th scope='row'><%= transaction.name %></td><td><%= current_user.name %></td><td>
                  <%= transaction.amount %></td><td><%= button_to 'Edit', edit_transaction_path(transaction),
                  method: :get, class: 'btn-primary'%></td><td><%= button_to 'Destroy', transaction,
                  class: 'btn-danger', method: :delete, data: { confirm: 'Are you sure?' } %></td></tr>"
    render inline: @html_out, locals: { transaction: transaction }
  end

  def list_dropdown(t)
    @html_out = ''
    if transaction_exists?(t)
      @html_out << "<li><div class='dropdown-item d-grid gap-2'><%= t.name %><%= button_to 'Remove', transaction_exists?(t), method: :delete %></div></li>"
    else
      @html_out << "<li><div class='dropdown-item d-grid gap-2'><%= t.name %><%= button_to 'Add', transaction_groups_path( group_id: @group.id, transaction_id: t.id ), method: :post %></div></li>"
    end
    render inline: @html_out, locals: { t: t }
  end
end
