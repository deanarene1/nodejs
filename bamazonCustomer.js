const mysql = require("mysql");
const inquirer = require('inquirer')

var connection = mysql.createConnection({
    host: "localhost",

    // Your port; if not 3306
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: "root",
    database: "bamazon"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    start();
});

function start() {
    connection.query("SELECT * FROM products", function (err, res) {
        for (let i = 0; i < res.length; i++) {
            let items = "Item ID: " + res[i].item_id +
                "\nProduct: " + res[i].product_name +
                "\nDepartment: " + res[i].department_name +
                "\nPrice: $" + res[i].price +
                "\nQuantity: " + res[i].stock_quantity +
                "\n------------------------------------------"
            console.log(items);
        }
        shopping()
    });
}

function shopping() {
    inquirer.prompt([{
        type: 'input',
        message: 'Enter the item ID you wish to purchase.',
        name: 'bought'
    },
    {
        type: 'input',
        message: 'Enter the amount you wish to purchase.',
        name: 'quantity'
    }
    ])
        .then(function (res) {
            const bought = res.bought;
            const quantity = parseInt(res.quantity)
            connection.query("SELECT * FROM products", function (err, res) {
                if (res[bought - 1].stock_quantity <= quantity) {
                    console.log('Sorry, we dont have enough product to fulfill that order!')
                }
                else {
                    connection.query("UPDATE products SET ? WHERE ?", [{
                        stock_quantity: res[bought - 1].stock_quantity - quantity
                    },
                    {
                        item_id: bought
                    }
                    ], function (err, res) {
                        console.log("You have purchased: " + res[bought - 1].product_name)
                        console.log("Quantity: " + quantity + " for a total of $" + ((res[bought - 1].price * quantity).toFixed(2)))
                    })
                }
            });
        })
}