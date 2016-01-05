module CompaniesHelper
  def base_company(company)
    base_company = company.market + " #{company.numerator}"
  end
end
