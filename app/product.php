<?php

include 'connect.php';

// insert
if (isset($_POST['simpan'])) {

    array_pop($_POST);
    echo '<pre>';
    print_r($_POST);
    echo '</pre>';

    extract($_POST);
    $db->query(
        'INSERT INTO sales_product ?',
        [ // here can be omitted question mark
            'product_name' => $product_name,
            'product_size' => $product_size,
            'product_base' => $product_base,
            // 'product_stock' => $product_stock,
            'created_at' => Date('Y-m-d H:i:s')
        ]
    );
    // INSERT INTO users (`name`, `year`) VALUES ('Jim', 1978)

    $id = $db->getInsertId(); // returns the auto-increment of inserted row
    echo $id;
}




// update
// $result = $db->query('UPDATE sales_product SET', [
//     'product_name' => $product_name,
//     'product_size' => $product_size,
//     'product_base' => $product_base,
//     'product_stock' => $product_stock
// ], 'WHERE id = ?', $id);
// UPDATE users SET `name` = 'Jim', `year` = 1978 WHERE id = 123

// echo $result->getRowCount(); // returns the number of affected rows


// delete
// $result = $db->query('DELETE FROM users WHERE id = ?', $id);
// echo $result->getRowCount(); // returns the number of affected rows


?>

<form action="" method="post">
    <p>Tambah produk</p>
    <p><input type="text" name="product_name" placeholder="Product name" required></p>
    <p><input type="number" step="0.1" name="product_size" placeholder="Product size" required></p>
    <p><input type="text" name="product_base" placeholder="Product base" required></p>
    <p><input value="Simpan" name="simpan" type="submit"></p>
</form>

<table border="1">
    <thead>
        <tr>
            <th>No</th>
            <th>Product Name</th>
            <th>Product Size</th>
            <th>Base</th>
            <th>Stock</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // view
        $result = $db->query('SELECT * FROM sales_product');
        $totalRow = $result->getRowCount(); // returns the number of rows if is known
        $no = 1;
        foreach ($result as $row) :
        ?>
            <tr>
                <td><?= $no ?></td>
                <td><?= $row->product_name; ?></td>
                <td><?= $row->product_size; ?></td>
                <td><?= $row->product_base; ?></td>
                <td><?= $row->product_stock; ?></td>
            </tr>
        <?php $no++;
        endforeach; ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="4">Total</td>
            <td><?= $totalRow; ?></td>
        </tr>
    </tfoot>
</table>