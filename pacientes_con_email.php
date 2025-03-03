<?php
// pacientes_con_email.php

require '../db.php'; // Incluye el archivo de configuración de la base de datos

try {
    // Consulta SQL para obtener los datos de la vista pacientes_con_email
    $sql = "SELECT * FROM pacientes_con_email";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    // Obtener los resultados
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar si hay resultados
    if (count($resultados) > 0) {
        echo "<h1>Pacientes con Correo Electrónico Registrado</h1>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Email</th></tr>";

        // Mostrar los datos en una tabla
        foreach ($resultados as $row) {
            echo "<tr>";
            echo "<td>" . $row['id_paciente'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "<td>" . $row['apellido'] . "</td>";
            echo "<td>" . $row['email'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "No se encontraron pacientes con correo electrónico registrado.";
    }
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
}

// Cerrar la conexión
$conn = null;
?>