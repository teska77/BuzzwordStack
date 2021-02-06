from backend_api import db, ma
class SampleModel(db.Model):
    __tablename__ = 'SampleModels'
    id = db.Column(db.Integer, primary_key = True)
    sample_string = db.Column(db.Text, nullable=True)

class SampleModel_Schema(ma.ModelSchema):
    class Meta:
        model = SampleModel
        fields = ('id', 'sample_string')
