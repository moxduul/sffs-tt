import './App.css';
import axios from 'axios';
import { useState, useEffect } from 'react';
import API_BASE_URL from './apiConfig';
import FileUpload from "./components/FileUpload";

function App() {
  const [data, setData] = useState([]);
  const [players, setPlayers] = useState([]);
  const [teams, setTeams] = useState([]);
  const [divisions, setDivisions] = useState([]);
  const [activeTab, setActiveTab] = useState("landing");
  const [form, setForm] = useState({});
  const [isEditing, setIsEditing] = useState(false);
  const [showForm, setShowForm] = useState(false);

  // Default columns to display for each entity
  const defaultColumns = {
    players: ["license_number", "first_name", "last_name", "ELO_points", "team"],
    teams: ["name", "team_number", "capitain", "division"],
    divisions: ["name", "teams"]
  };

  const fetchData = (entity) => {
    axios.get(`${API_BASE_URL}/${entity}/`)
      .then(response => setData(response.data))
      .catch(error => console.error(`Error fetching ${entity}:`, error));

    if (entity === "players" || entity === "teams") {
      axios.get("${API_BASE_URL}/teams/")
        .then(response => setTeams(response.data))
        .catch(error => console.error("Error fetching teams:", error));
      axios.get("${API_BASE_URL}/divisions/")
        .then(response => setDivisions(response.data))
        .catch(error => console.error("Error fetching divisions:", error));
      axios.get("${API_BASE_URL}/players/")
        .then(response => setPlayers(response.data))
        .catch(error => console.error("Error fetching players:", error));
    }
  };

  useEffect(() => {
    if (activeTab !== "landing") {
      fetchData(activeTab);
    }
  }, [activeTab]);

  const resetForm = () => {
    setForm({});
    setIsEditing(false);
    setShowForm(false);
  };

  const handleEdit = (item) => {
    setForm(item);
    setIsEditing(true);
    setShowForm(true);
  };

  const handleDelete = (id) => {
    axios.delete(`${API_BASE_URL}/${activeTab}/${id}`)
      .then(() => fetchData(activeTab))
      .catch(error => console.error(`Error deleting ${activeTab}:`, error));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const url = isEditing
      ? `${API_BASE_URL}/${activeTab}/${form.id}`
      : `${API_BASE_URL}/${activeTab}/`;

    const method = isEditing ? axios.put : axios.post;
    method(url, form)
      .then(() => {
        fetchData(activeTab);
        resetForm();
      })
      .catch(error => console.error(`Error saving ${activeTab}:`, error));
  };


  const renderFormFields = () => {
    switch (activeTab) {
      case "players":
        return (
          <>
            <input type="text" placeholder="License Number" value={form.license_number || ""} onChange={(e) => setForm({ ...form, license_number: e.target.value })} required className="border p-2 mr-2" />
            <input type="text" placeholder="First Name" value={form.first_name || ""} onChange={(e) => setForm({ ...form, first_name: e.target.value })} required className="border p-2 mr-2" />
            <input type="text" placeholder="Last Name" value={form.last_name || ""} onChange={(e) => setForm({ ...form, last_name: e.target.value })} required className="border p-2 mr-2" />
            <input type="text" placeholder="Email" value={form.email || ""} onChange={(e) => setForm({ ...form, email: e.target.value })} className="border p-2 mr-2" />
            <input type="text" placeholder="Phone 1" value={form.phone1 || ""} onChange={(e) => setForm({ ...form, phone1: e.target.value })} className="border p-2 mr-2" />
            <input type="text" placeholder="Phone 2" value={form.phone2 || ""} onChange={(e) => setForm({ ...form, phone2: e.target.value })} className="border p-2 mr-2" />
            <select value={form.team_id || ""} onChange={(e) => setForm({ ...form, team_id: e.target.value })} className="border p-2 mr-2">
              <option value="">Select Team</option>
              {teams.map(team => (
                <option key={team.id} value={team.id}>{team.name}</option>
              ))}
            </select>
            <input type="text" placeholder="Classification" value={form.classification || ""} onChange={(e) => setForm({ ...form, classification: e.target.value })} className="border p-2 mr-2" />
            <input type="text" placeholder="ELO points" value={form.ELO_points || ""} onChange={(e) => setForm({ ...form, ELO_points: e.target.value })} className="border p-2 mr-2" />
          </>
        );
      case "teams":
        return (
          <>
            <input type="text" placeholder="Name" value={form.name || ""} onChange={(e) => setForm({ ...form, name: e.target.value })} required className="border p-2 mr-2" />
            <input type="text" placeholder="Team Number" value={form.team_number || ""} onChange={(e) => setForm({ ...form, team_number: e.target.value })} required className="border p-2 mr-2" />
            <select value={form.division_id || ""} onChange={(e) => setForm({ ...form, division_id: e.target.value })} className="border p-2 mr-2">
              <option value="">Select Division</option>
              {divisions.map(division => (
                <option key={division.id} value={division.id}>{division.name}</option>
              ))}
            </select>
            <select value={form.capitain_id || ""} onChange={(e) => setForm({ ...form, capitain_id: e.target.value })} className="border p-2 mr-2">
              <option value="">Select Capitain</option>
              {players.map(player => (
                <option key={player.id} value={player.id}>{player.first_name} {player.last_name}</option>
              ))}
            </select>
          </>
        );
        case "divisions":
        return (
          <input type="text" placeholder="Name" value={form.name || ""} onChange={(e) => setForm({ ...form, name: e.target.value })} required className="border p-2 mr-2" />
        )
      default:
        return null;
    }
  };

  return (
    <div className="bg-gray-50 min-h-screen">
      <header className="bg-blue-600 text-white p-4 shadow">
        <h1 className="text-3xl font-bold text-center">SFFS TT Basel 3</h1>
      </header>

      <div className="text-center mt-6">
        <button onClick={() => setActiveTab("landing")} className="px-4 py-2 bg-blue-500 text-white mr-2 rounded">Home</button>
        <button onClick={() => setActiveTab("players")} className="px-4 py-2 bg-blue-500 text-white mr-2 rounded">Players</button>
        <button onClick={() => setActiveTab("teams")} className="px-4 py-2 bg-blue-500 text-white mr-2 rounded">Teams</button>
        <button onClick={() => setActiveTab("divisions")} className="px-4 py-2 bg-blue-500 text-white rounded">Divisions</button>
      </div>

      <main className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow mt-6">
        {activeTab === "landing" && (
          <div className="text-center">
            <h2 className="text-4xl font-extrabold text-gray-800 mb-4">SFFS TT Basel</h2>
            <p className="text-lg text-gray-600">Manage players, teams, and divisions efficiently.</p>
          </div>
        )}

        {activeTab !== "landing" && (
          <div>
            <h2 className="text-2xl font-bold mb-4">{activeTab.charAt(0).toUpperCase() + activeTab.slice(1)}</h2>

            <FileUpload
              uploadEndpoint={`${API_BASE_URL}/upload-${activeTab}/`}
              onUploadSuccess={() => {
               fetchData(activeTab);
               alert("File uploaded successfully.");
              }}
              onUploadFailure={(error) => {
                console.error("Error uploading file:", error);
                alert("Failed to upload file.");
              }}
            />

            <button onClick={() => setShowForm(!showForm)} className="px-4 py-2 bg-blue-500 text-white rounded mb-4">
              {showForm ? "Hide Form" : "Add/Edit"}
            </button>
            {showForm && (
              <form onSubmit={handleSubmit} className="mb-6">
                {renderFormFields()}
                <button type="submit" className="px-4 py-2 bg-green-500 text-white rounded">{isEditing ? "Update" : "Add"}</button>
                {isEditing && <button type="button" onClick={resetForm} className="px-4 py-2 bg-gray-500 text-white ml-2 rounded">Cancel</button>}
              </form>
            )}
            <table className="min-w-full table-auto">
              <thead>
                <tr>
                  {defaultColumns[activeTab]?.map(column => (
                    <th key={column} className="px-4 py-2">{column}</th>
                  ))}
                  <th className="px-4 py-2">Actions</th>
                </tr>
              </thead>
              <tbody>
                {data.map(item => (
                  <tr key={item.id}>
                    {defaultColumns[activeTab]?.map(column => (
                      <td key={column} className="border px-4 py-2">{item[column]}</td>
                    ))}
                    <td className="border px-4 py-2">
                      <button onClick={() => handleEdit(item)} className="px-2 py-1 bg-blue-500 text-white rounded mr-2">Edit</button>
                      <button onClick={() => handleDelete(item.id)} className="px-2 py-1 bg-red-500 text-white rounded">Delete</button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </main>
    </div>
  );
}

export default App;
