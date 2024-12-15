import React, { useState } from "react";
import axios from "axios";

const FileUpload = ({ entityName, uploadEndpoint, onUploadSuccess }) => {
  const [file, setFile] = useState(null);
  const [uploadStatus, setUploadStatus] = useState("");

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleUpload = async () => {
    if (!file) {
      setUploadStatus("Please select a file to upload.");
      return;
    }

    const formData = new FormData();
    formData.append("file", file);

    try {
      const response = await axios.post(uploadEndpoint, formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      setUploadStatus(`Upload successful: ${response.data.message}`);
      if (onUploadSuccess) onUploadSuccess();
    } catch (error) {
      console.error("Error uploading file:", error);
      setUploadStatus("Upload failed. Please check the file format and try again.");
    }
  };

  return (
    <div className="file-upload">
      <h3 className="text-lg font-bold mb-2">Bulk Upload for {entityName}</h3>
      <input
        type="file"
        accept=".xlsx"
        onChange={handleFileChange}
        className="mb-2"
      />
      <button
        onClick={handleUpload}
        className="px-4 py-2 bg-blue-500 text-white rounded"
      >
        Upload File
      </button>
      {uploadStatus && (
        <p className="mt-2 text-sm">
          {uploadStatus}
        </p>
      )}
    </div>
  );
};

export default FileUpload;
