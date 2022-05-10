function formatNumber(number) {
    var amount = number.toLocaleString("en-US", {
        style: "currency",
        currency: "USD",
    });
    return amount.replace("$", "").replace(".00", "");
}