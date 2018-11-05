#
#
#

variable name {
  description = "The display name for the application."
}

variable "homepage" {
  description = "The URL to the application's home page. The default is https://$${name}"
  
  default = ""
}

variable "identifier_uris" {
  description = "A list of user-defined URI(s) that uniquely identify a Web application within it's Azure AD tenant, or within a verified custom domain if the application is multi-tenant. The dedault is $${homepage}"

  default = []
}

variable "reply_urls" {
  description = "A list of URLs that user tokens are sent to for sign in, or the redirect URIs that OAuth 2.0 authorization codes and access tokens are sent to."

  default = []
}

variable "available_to_other_tenants" {
  description = "Is this Azure AD Application available to other tenants?"
    
  default = false
}

variable "oauth2_allow_implicit_flow" {
  description = "Does this Azure AD Application allow OAuth2.0 implicit flow tokens?"

  default = false
}

variable "end_date" {
  description = "The End Date which the Password is valid until, formatted as a RFC3339 date string. The default is the current dayte + 30 days"

  default = ""
}

variable "start_date" {
  description = "The Start Date which the Password is valid from, formatted as a RFC3339 date string. If this isn't specified, the current date is used."

  default = ""
}