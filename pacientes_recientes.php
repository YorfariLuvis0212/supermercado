<?php
// pacientes_recientes.php

require '../db.php';

try {
    $sql = "SELECT * FROM pacientes_recientes";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($resultados) > 0) {
        echo "<h1>Pacientes Registrados Recientemente</h1>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Fecha de Registro</th></tr>";

        foreach ($resultados as $row) {
            echo "<tr>";
            echo "<td>" . $row['id_paciente'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "<td>" . $row['apellido'] . "</td>";
            echo "<td>" . $row['fecha_registro'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "No se encontraron pacientes registrados recientemente.";
    }
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
}

$conn = null;
?>