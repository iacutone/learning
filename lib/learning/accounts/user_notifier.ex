defmodule Learning.Accounts.UserNotifier do
  import Swoosh.Email

  alias Learning.Mailer

  # Delivers the email using the application mailer.
  defp deliver(recipient, subject, text_body, html_body \\ nil) do
    email =
      new()
      |> to(recipient)
      |> from({"Learning", "noreply@iacut.one"})
      |> subject(subject)
      |> text_body(text_body)

    email = if html_body, do: html_body(email, html_body), else: email

    with {:ok, _metadata} <- Mailer.deliver(email) do
      {:ok, email}
    end
  end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    text_content = """
    ==============================

    Hi #{user.email},

    You can confirm your account by visiting the URL below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    """

    html_content = """
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #333;">Welcome to Learning!</h2>
      <p>Hi #{user.email},</p>
      <p>You can confirm your account by clicking the button below:</p>
      <div style="text-align: center; margin: 30px 0;">
        <a href="#{url}" style="background-color: #007cba; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; display: inline-block;">Confirm Account</a>
      </div>
      <p>Or copy and paste this URL into your browser:</p>
      <p style="word-break: break-all; color: #666;"><a href="#{url}">#{url}</a></p>
      <p style="color: #666; font-size: 14px;">If you didn't create an account with us, please ignore this email.</p>
    </div>
    """

    deliver(user.email, "Confirm your Learning account", text_content, html_content)
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    text_content = """
    ==============================

    Hi #{user.email},

    You can reset your password by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """

    html_content = """
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #333;">Reset Your Password</h2>
      <p>Hi #{user.email},</p>
      <p>You can reset your password by clicking the button below:</p>
      <div style="text-align: center; margin: 30px 0;">
        <a href="#{url}" style="background-color: #dc3545; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; display: inline-block;">Reset Password</a>
      </div>
      <p>Or copy and paste this URL into your browser:</p>
      <p style="word-break: break-all; color: #666;"><a href="#{url}">#{url}</a></p>
      <p style="color: #666; font-size: 14px;">If you didn't request this change, please ignore this email.</p>
    </div>
    """

    deliver(user.email, "Reset your Learning password", text_content, html_content)
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    text_content = """
    ==============================

    Hi #{user.email},

    You can change your email by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """

    html_content = """
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #333;">Update Your Email</h2>
      <p>Hi #{user.email},</p>
      <p>You can update your email address by clicking the button below:</p>
      <div style="text-align: center; margin: 30px 0;">
        <a href="#{url}" style="background-color: #28a745; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; display: inline-block;">Update Email</a>
      </div>
      <p>Or copy and paste this URL into your browser:</p>
      <p style="word-break: break-all; color: #666;"><a href="#{url}">#{url}</a></p>
      <p style="color: #666; font-size: 14px;">If you didn't request this change, please ignore this email.</p>
    </div>
    """

    deliver(user.email, "Update your Learning email", text_content, html_content)
  end
end
