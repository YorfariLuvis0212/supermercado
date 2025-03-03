<?php
// medicos_recientes.php

require '../db.php'; // Incluye el archivo de configuración de la base de datos

try {
    // Consulta SQL para obtener los datos de la vista medicos_recientes
    $sql = "SELECT * FROM medicos_recientes";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    // Obtener los resultados
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar si hay resultados
    if (count($resultados) > 0) {
        echo "<h1>Médicos Contratados Recientemente (Últimos 6 Meses)</h1>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Especialidad</th><th>Fecha de Contratación</th></tr>";

        // Mostrar los datos en una tabla
        foreach ($resultados as $row) {
            echo "<tr>";
            echo "<td>" . $row['id_medico'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "<td>" . $row['apellido'] . "</td>";
            echo "<td>" . $row['especialidad'] . "</td>";
            echo "<td>" . $row['fecha_contratacion'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "No se encontraron médicos contratados en los últimos 6 meses.";
    }
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
}

// Cerrar la conexión
$conn = null;
?>