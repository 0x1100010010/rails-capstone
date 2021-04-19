module ApplicationHelper
  def current_user
    if session[:user_id]
      begin
        @current_user ||= User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = 'No session found!'
      end
    else
      @current_user = nil
    end
  end

  def require_session
    redirect_to welcome_path, alert: 'Sign Up or Sign In to access this feature!' unless current_user
  end

  def render_submit(form)
    if request.fullpath.include?('edit')
      form.submit 'Update', class: 'btn btn-primary py-3 text-light mb-2 shadow-0'
    else
      form.submit 'Create', class: 'btn btn-primary py-3 text-light mb-2 shadow-0'
    end
  end

  def render_header
    html_out = ''
    if current_user
      html_out << "<li class='nav-item'><%= link_to 'Groups', groups_path, class: 'nav-link px-3' %></li>"
      html_out << "<li class='nav-item'><%= link_to 'Transactions', transactions_path, class: 'nav-link px-3' %></li>"
      html_out << "<li class='nav-item'>"
      html_out << "<%= link_to 'Extenal Transactions', external_transactions_path, class: 'nav-link px-3' %></li>"
      html_out << "<li class='nav-item'><%= link_to current_user.name, current_user, class: 'nav-link px-3' %></li>"
      html_out << "<li class='nav-item'><%= link_to 'Sign Out', signout_path, class: 'nav-link px-3' %></li>"
    else
      html_out << "<li class='nav-item'>
                <%= link_to 'Sign In', signin_path, class: 'nav-link px-3'if current_page?(signup_path) %>
                <%= link_to 'Sign Up', signup_path, class: 'nav-link px-3' if current_page?(signin_path) %>
              </li>"
    end
    render inline: html_out
  end

  def error_log(obj)
    html_out = ''
    if obj.errors.any?
      html_out << "<div id='error_explanation'><h2><%= pluralize(obj.errors.count, 'error') %> prohibited this entry
                  from being saved:</h2><ul><% obj.errors.each do |error| %><li><%= error.full_message %></li>
                  <% end %></ul></div>"
    end
    render inline: html_out, locals: { obj: obj }
  end
end
