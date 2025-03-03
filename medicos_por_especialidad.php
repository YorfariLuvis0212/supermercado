<?php
// medicos_por_especialidad.php

require '../db.php';

try {
    $sql = "SELECT * FROM medicos_por_especialidad";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($resultados) > 0) {
        echo "<h1>Médicos por Especialidad</h1>";
        echo "<table border='1'>";
        echo "<tr><th>Especialidad</th><th>Total de Médicos</th></tr>";

        foreach ($resultados as $row) {
            echo "<tr>";
            echo "<td>" . $row['especialidad'] . "</td>";
            echo "<td>" . $row['total'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "No se encontraron datos para médicos por especialidad.";
    }
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
}

$conn = null;
?>