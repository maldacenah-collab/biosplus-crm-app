// src/utils/fileExport.ts

/**
 * Creates a CSV file from headers and rows and triggers a download.
 * Handles escaping of special characters.
 * @param headers An array of strings for the CSV header row.
 * @param rows An array of arrays, where each inner array represents a row.
 * @param fileName The name of the file to be downloaded.
 */
export const exportToCSV = (headers: string[], rows: (string | number | null | undefined)[][], fileName: string) => {
    try {
        const escapeCell = (cell: any): string => {
            const cellValue = cell === null || cell === undefined ? '' : String(cell);
            // Escape quotes by doubling them and wrap in quotes if it contains a separator, quote, or newline
            if (/[";\n]/.test(cellValue)) {
                return `"${cellValue.replace(/"/g, '""')}"`;
            }
            return cellValue;
        };

        const csvContent = [
            headers.map(escapeCell).join(';'),
            ...rows.map(row => row.map(escapeCell).join(';'))
        ].join('\n');

        const blob = new Blob(["\uFEFF" + csvContent], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement("a");
        const url = URL.createObjectURL(blob);
        link.setAttribute("href", url);
        link.setAttribute("download", fileName);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        URL.revokeObjectURL(url);
    } catch (error) {
        console.error("Error exporting to CSV:", error);
        alert("No se pudo generar el archivo CSV.");
    }
};
