<?php
// pacientes_mayores.php

require '../db.php';

try {
    $sql = "SELECT * FROM pacientes_mayores";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($resultados) > 0) {
        echo "<h1>Pacientes Mayores de Edad</h1>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Fecha de Nacimiento</th></tr>";

        foreach ($resultados as $row) {
            echo "<tr>";
            echo "<td>" . $row['id_paciente'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "<td>" . $row['apellido'] . "</td>";
            echo "<td>" . $row['fecha_nacimiento'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "No se encontraron pacientes mayores de edad.";
    }
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
}

$conn = null;
?>