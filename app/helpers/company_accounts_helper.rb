module CompanyAccountsHelper
  def base_company(company_account)
    if company_account.market != nil && company_account.numerator != nil
      base_company = company_account.market + " #{company_account.numerator}"
    else
      base_company = nil
    end
  end
  def base_company_from_id(company_account_id)
    company_account = CompanyAccount.find(company_account_id)
    base_company = company_account.market + " #{company_account.numerator}"
  end
end
