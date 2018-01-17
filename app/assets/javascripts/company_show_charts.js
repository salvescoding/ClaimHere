// Claims responded/not chart
var ctx = document.getElementById("myClaimsChart").getContext('2d');
var myClaimsChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Claims not responded", "Claims responded"],
    datasets: [{
      label: '# of Votes',
      data: [<%= @company.complaints_received - @company.complaints_answered %>, <%= @company.complaints_answered %>],
      backgroundColor: [
      "#eaf4fb",
      "#85c1e9"
      ],
      borderColor: [
      "#eaf4fb",
      "#85c1e9"
      ],
      borderWidth: 1
    }]
  },
});
// New/Old Customer chart
var ctx = document.getElementById("myCustomerChart").getContext('2d');
var myCustomerChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["New customer claims", "Old customer claims"],
    datasets: [{
      label: '# of Votes',
      data: [<%= @company.complaints.where(old_customer: false).count %>, <%= @company.complaints.where(old_customer: true).count %>],
      backgroundColor: [
      '#85c1e9',
      '#eaf4fb'
      ],
      borderColor: [
      '#85c1e9',
      '#eaf4fb'
      ],
      borderWidth: 1
    }]
  },
});

// Category chart
var ctx = document.getElementById("myCategoryChart").getContext('2d');
var myCategoryChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Product/service", "Customer service", "After sales", "Shipping", "Other"],
    datasets: [{
      label: '# of Votes',
      data: [<%= @company.complaints.where(category: "Product/service").count %>, <%= @company.complaints.where(category: "Customer service").count %>, <%= @company.complaints.where(category: "After sales").count %>, <%= @company.complaints.where(category: "Shipping").count %>, <%= @company.complaints.where(category: "Other").count %>],
      backgroundColor: [
      "#1f5b83",
      "#2e88c5",
      "#48a2de",
      "#85c1e9",
      "#eaf4fb"],
      borderColor: [
      "#1f5b83",
      "#2e88c5",
      "#48a2de",
      "#85c1e9",
      "#eaf4fb"],
      borderWidth: 1
    }]
  },
});
// Rating chart
var ctx = document.getElementById("myRatingChart").getContext('2d');
  var myRatingChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["1", "2", "3", "4", "5"],
      datasets: [{
        label: '# of Stars',
        data: [<%= @company.complaints.where(response_rating: 1).count %>, <%= @company.complaints.where(response_rating: 2).count %>, <%= @company.complaints.where(response_rating: 3).count %>, <%= @company.complaints.where(response_rating: 4).count %>, <%= @company.complaints.where(response_rating: 5).count %>],
        backgroundColor: [
        "#1f5b83",
        "#2e88c5",
        "#48a2de",
        "#85c1e9",
        "#eaf4fb"],
        borderColor: [
        "#1f5b83",
        "#2e88c5",
        "#48a2de",
        "#85c1e9",
        "#eaf4fb"],
        borderWidth: 1
      }]
    },
    options: {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true
            }
        }]
    }
}
  });




