from backend_api import db, ma
class CountModel(db.Model):
    __tablename__ = 'Counts'
    id = db.Column(db.Integer, primary_key = True)

class CountModel_Schema(ma.ModelSchema):
    class Meta:
        model = CountModel
        fields = ('id',)
