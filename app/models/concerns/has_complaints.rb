module HasComplaints

  def complaints_answered
    complaints.where.not(response: nil).count
  end

  def complaints_solved
    complaints.where(response_solved: true).count
  end

end
