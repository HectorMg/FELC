module CompanyAccountsHelper
  def base_company(company_account)
    if company_account.market != nil && company_account.numerator != nil
      base_company = company_account.market + " #{company_account.numerator}"
    else
      base_company = nil
    end
  end
  def base_company_from_id(company_account_id)
    if company_account_id != nil
      company_account = CompanyAccount.find(company_account_id)
      if company_account.market != nil && company_account.numerator != nil
        base_company = company_account.market + " #{company_account.numerator}"
      elsif company_account.id == 7
        base_company = "The Bank"
      else
        base_company = nil
      end
    else
      company_account = nil
    end
  end
end
